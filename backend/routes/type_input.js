const router = require("express").Router();
const { check, query } = require("express-validator");
const service = require("../services/serviceinput");

// 
router.get("/", async (req, res) => {
  res.json("this is type_input Route");
});




//----------------------- groupitem หรือ คลังสินค้า -------------------------------------------------------------------------------------------
router.get("/groupitem", async (req, res) => {
  try {
    const groupitem = await service.findGroupitem();
    if (!groupitem) throw new Error("Not Found Item !!!");
    res.json(groupitem);
  } catch (ex) {
    res.error(ex);
  }
});

// เรียกข้อมูลบริจาครายนชิ้นเพื่อแสดงข้อมูลตอนแก้ไข
router.get("/groupitem/:id", async (req, res) => {
  try {
    const itemtype = await service.findItemtypeByid(req.params.id);
    if (!itemtype) throw new Error("Not Found Item !!!");
    res.json(itemtype);
  } catch (ex) {
    res.error(ex);
  }
});

//เพิ่มข้อมูลกลุ่มรายการสินค้า
router.post( "/groupitem",[check("type_name", "โปรดกรอกข้อมูลชื่อกลุ่มสินค้าหรือชื่อที่จัดเก็บสินค้า") .not().isEmpty() ],
  async (req, res) => {
    try {
      req.validate();
      res.json({ message: await service.onAddgroupItem(req.body) });
    } catch (ex) {
      res.error(ex);
    }
  }
);

// แก้ไขกลุ่ม

router.put("/groupitem/:id",[
  check('item_name_type').not().isEmpty(),
], async (req, res) => {
  try {
    req.validate();
    const finditem = await service.findItemtypeByid(req.params.id);
    // console.log(finditem)
    if (!finditem) throw new Error("ไม่พบข้อมูลที่ค้นหา");
    res.json(await service.EditGroupitemByid(finditem.item_type_id,req.body));
  } 
  catch (ex) { res.error(ex);
  }
});

//ลบกลุ่ม
router.delete("/groupitem/:id", async (req, res) => {
  try {
    const groupitem = await service.DeleteGroupitemByid({ groupitem_id: req.params.id,});
    if (!groupitem) throw new Error("Not Found Item !!!");
    res.json(groupitem);
  } catch (ex) {
    res.error(ex);
  }
});





//----------------------- itemtype --------------------------------------------------------------------------------------------
router.get("/itemtype", async (req, res) => {
  try {
    const itemtype = await service.findItemtype();
    if (!itemtype) throw new Error("Not Found Item !!!");
    res.json(itemtype);
  } catch (ex) {
    res.error(ex);
  }
});
//เพิ่มข้อมูลกลุ่มรายการสินค้า
router.post(
  "/itemtype",
  [
    check("item_name_type", "โปรดกรอกชื่อหน่วยนับที่ต้องการ").not().isEmpty(),
  ],
  async (req, res) => {
    try {
      req.validate();
      res.json({ message: await service.onAddItemType(req.body) });
    } catch (ex) {
      res.error(ex);
    }
  }
);
//แก้ไขรายการสินค้า
router.put(
  "/itemtype/:id",
  [
    check("item_name_type", "โปรดกรอกชื่อหน่วยนับที่ต้องการ").not().isEmpty(),
    check("amount", "โปรดกรอกจำนวนต่อหน่วย").not().isEmpty().isInt(),
  ],
  async (req, res) => {
    try {
      req.validate();
      res.json({ message: await service.onEditItemType(req.body) });
    } catch (ex) {
      res.error(ex);
    }
  }
);
router.delete("/itemtype/:id", async (req, res) => {
  try {
    res.json({ message: await service.onDeleteItemType(req.params.id) });
  } catch (ex) {
    res.error(ex);
  }
});





//----------------------- itemlist ---------------------------------------------------------------------------------------

router.get("/itemlist", async (req, res) => {
  try {
    const itemlist = await service.findItemList();
    if (!itemlist) throw new Error("Not Found Item !!!");
    res.json(itemlist);
  } catch (ex) {
    res.error(ex);
  }
});

//แสดงข้อมูลแค่ 1 rowเพื่อแก้ไข
router.get("/itemlist/:id", async (req, res) => {
  try {
    // console.log(req.params.id)
    const onelistitem = await service.findItemListByid(req.params.id);
    if (!onelistitem) throw new Error("Not Found Item !!!");
    res.json(onelistitem);
  } catch (ex) {
    res.error(ex);
  }
});

router.get("/itemlistgroupid/:id", async (req, res) => {// หน้า adddonate ดึงรายการสินค้าตามกลุ่มที่เลือก
  try {
    const itemlistgroupid = await service.findItemListBygroupId(req.params.id);
    if (!itemlistgroupid) throw new Error("Not Found Item !!!");
    res.json(itemlistgroupid);
  } catch (ex) {
    res.error(ex);
  }
});


//เพิ่มข้อมูลสินค้ารับบริจาครายชื่อและพประเภทต่างๆ
router.post( "/add-item",
  [
    check( "item_type_id", "โปรดเลือกหน่วยบรรจุ") .not() .isEmpty() .isInt(),
    check("group_item_type_id", "โปรดเลือกกลุ่มประเภท").not().isEmpty().isInt(),
    check("item_name", "โปรดกรอกชื่อรายการสินค้า").not().isEmpty(),
  ],
  async (req, res) => {
    try {
      req.validate();
      res.json({ message: await service.onAdditemlist(req.body) });
    } catch (ex) {
      res.error(ex);
    }
  }
);

module.exports = router;
