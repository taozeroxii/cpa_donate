const router = require('express').Router();
const { check, query } = require("express-validator");
const service = require('../services/serviceinput');

// เรียกข้อมูลบริจาคทั้งหมด
router.get('/',async (req,res)=>{ 
 res.json("this is type_input Route");
})



//----------------------- groupitem ----------------------------------------------
router.get('/groupitem',async (req,res)=>{ 
    try{
        const groupitem =await service.findGroupitem()
        if(!groupitem) throw new Error('Not Found Item !!!');
        res.json(groupitem);
    }
    catch(ex){res.error(ex)}
})
// เรียกข้อมูลบริจาครายนชิ้นเพื่อแสดงข้อมูลตอนแก้ไข
router.get('/groupitem/:id',async (req,res)=>{
    try{
        const groupitem =await service.findGroupitemByid({ groupitem_id:req.params.id })
        if(!groupitem) throw new Error('Not Found Item !!!');
        res.json(groupitem);
    }
    catch(ex){res.error(ex)}
})


//----------------------- itemtype ----------------------------------------------
router.get('/itemtype',async (req,res)=>{ 
    try{
        const itemtype = await service.findItemtype()
        if(!itemtype) throw new Error('Not Found Item !!!');
        res.json(itemtype);
    }
    catch(ex){res.error(ex)}
})

//----------------------- itemlist ----------------------------------------------
router.get('/itemlist',async (req,res)=>{ 
    try{
        const itemlist = await service.findItemList()
        if(!itemlist) throw new Error('Not Found Item !!!');
        res.json(itemlist);
    }
    catch(ex){res.error(ex)}
})

router.get('/itemlistbyid/:id',async (req,res)=>{ 
    try{
        // console.log(req.params.id)
        const onelistitem = await service.findItemListByid(req.params.id)
        if(!onelistitem) throw new Error('Not Found Item !!!');
        res.json(onelistitem);
    }
    catch(ex){res.error(ex)}
})



module.exports = router;