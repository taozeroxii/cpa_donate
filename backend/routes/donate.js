const router = require('express').Router();
const { check, query } = require("express-validator");
const service = require('../service/servicedonate');

// เรียกข้อมูลบริจาคทั้งหมด
router.get('/itemlist',async (req,res)=>{ 
    try{
        const itemlist =await service.findAllitemList()
        if(!itemlist) throw new Error('Not Found Item !!!');
        res.json(itemlist);
    }
    catch(ex){res.error(ex)}
})


// เรียกข้อมูลบริจาครายนชิ้นเพื่อแสดงข้อมูลตอนแก้ไข
router.get('/itemlist/:id',async (req,res)=>{
    try{
        const listitem =await service.findOneitemList({ item_id:req.params.item_id })
        if(!listitem) throw new Error('Not Found Item !!!');
        res.json(listitem);
    }
    catch(ex){res.error(ex)}
})

//เพิ่มข้อมูลอุปกรณื
router.post('/additem', [
    check('item_name').not().isEmpty(),
    check('item_type_id').not().isEmpty()
], async (req, res) => {
    try {
        req.validate();
        res.json({ message: await service.insertItem(req.body) })
    }
    catch (ex) {
        res.error(ex);
    }
})

//ลบข้อมูล
router.delete('/:id', async (req, res) => {
    try {
        const Item = await service.findOne({ eq_id: req.params.id })//หาข้อมูลในตาราง
        if (!Item) throw new Error('Not found item');
        const deleteItem = await service.onDelete(Item.eq_id)//รับ id มาและเอาไปเช็คว่าตรงกับ idไหนในตารางและลบออกไป
        const deleteImg = path.join(equipDir, Item.eq_image);// ตัวแปร deleteImg เก็บค่าพาร์ทที่อยู่ไฟล์รูปภาพและชื่อภาพว่าเป็นภาพไหน Item.eq_image คือชื่อไฟล์นั้น
        if (fs.existsSync(deleteImg)) fs.unlink(deleteImg, () => null);// ถ้าหากเจอภาพให้ลบอออกไปใส่ callback กับerror
        res.send(deleteItem);
    }
    catch (ex) {
        res.error(ex);
    }
})

//แก้ไขข้อมูล
router.put('/:id', [
    check('eq_name').not().isEmpty(),
    check('eq_image').not().isEmpty()
], async (req, res) => {
    try {
        req.validate();

        // หาข้อมูลที่จะแก้ไข
        const Item = await service.findOne({ eq_id: req.params.id })//หาข้อมูลในตาราง
        if (!Item) throw new Error('Not found item');

        // ตรวจสอบ folder หากไม่มีให้ทำการสร้างfolder อันแรกให้สร้างโฟลเดอร์ upload และ2สร้าง equipments ในupload
        if (!fs.existsSync(uploadDir)) fs.mkdirSync(uploadDir);
        if (!fs.existsSync(equipDir)) fs.mkdirSync(equipDir);

        //แปลงข้อมูลbase64เป็นรูปภาพ  
        req.body.eq_image = base64Img
            .imgSync(req.body.eq_image, equipDir, `equip-${Date.now()}`)
            .replace(equipDir, '').replace('\\', '');

        const updateItem = await service.onUpdate(req.params.id, req.body);
        //ตรวจสอบหากมีการเปลี่ยนแปลงข้อมูลตัว affectedRows จะไม่ใช่ 0 และสั่งลบภาพเดิมออก
        if (updateItem.affectedRows > 0) {
            const deleteImg = path.join(equipDir, Item.eq_image);
            if (fs.existsSync(deleteImg)) fs.unlink(deleteImg, () => null);
        }
        res.json(updateItem)
    }
    catch (ex) {
        const delImg = path.join(equipDir, req.body.eq_image || '');
        if (fs.existsSync(delImg)) fs.unlinkSync(delImg, () => null);
        res.error(ex);
    }
})

module.exports = router;