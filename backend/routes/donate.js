const router = require("express").Router();
const { check, query } = require("express-validator");
const service = require("../services/servicedonate");

router.get("/", (req, res) => {
  res.json({ message: "donate route" });
});

//--------------------แสดงข้อมูลรับบริจาคทั้งหมด------------------------------------------------------------------------
router.get("/donatelist", async (req, res) => {
  try {
    const result = await service.findAllDonateList();
    res.json(result);
  } catch (ex) {
    res.error(ex);
  }
});
router.post("/add-donate",[
    check("donate_head_id", "โปรดใส่เลขที่รับบริจาค").not().isEmpty(),
    check("donor_id", "โปรดเลือกผู้รับบริจาค") .not() .isEmpty(),
    check("amount", "โปรดกรอกจำนวนที่เป็นตัวเลขเท่านั้น").not().isEmpty() .isInt({ min: 1 }),
    check("item_id", "โปรดเลือกรายการสิ่งของ") .not() .isEmpty(),
  ],async (req, res) => {
    try {
      req.validate();
      res.json({ message: await service.insertDetaildonate(req.body) });
    } catch (ex) {
      res.error(ex);
    }
  }
);
router.post("/edit-donate/:id",[
  check("donate_head_id", "โปรดกรอกเลขที่รับมอบ").not().isEmpty(),
  check("item_id", "โปรดเลือกรายการสินค้า").not().isEmpty(),
  ],async (req, res) => {
    try {
      req.validate();
      res.json({ message: await service.editDonate(req.params.id,req.body) });
    } catch (ex) {
      res.error(ex);
    }
  }
);

router.get("/donatelist/:id", async (req, res) => {
  try {
    // console.log(req.params.id)
    const donateitem = await service.findOneDonatelist(req.params.id);
    if (!donateitem) throw new Error("Not Found Item !!!");
    res.json(donateitem);
  } catch (ex) {
    // res.error(ex);
  }
});


//------------------------ผู้รับบริจาค ผู้มอบ ---------------------------------------------------------
router.get("/donorlist", async (req, res) => {
  try {
    const result = await service.findAllDonor();
    res.json(result);
  } catch (ex) {
    res.error(ex);
  }
});
router.get("/donorlist/:id", async (req, res) => {
  try {
    // console.log(req.params.id)
    const onelistitem = await service.finddonorlistByid(req.params.id);
    if (!onelistitem) throw new Error("Not Found Item !!!");
    res.json(onelistitem);
  } catch (ex) {
    res.error(ex);
  }
});
router.post("/add-donor",[
  check("donor_name", "โปรดกรอกข้อมูล").not().isEmpty(),
  ],async (req, res) => {
    try {
      req.validate();
      res.json({ message: await service.insertDonor(req.body) });
    } catch (ex) {
      res.error(ex);
    }
  }
);
 router.post("/edit-donor/:id",[
  check("donor_name", "โปรดกรอกข้อมูล").not().isEmpty(),
  ],async (req, res) => {
    try {
      req.validate();
      res.json({ message: await service.editDonor(req.params.id,req.body) });
    } catch (ex) {
      res.error(ex);
    }
  }
);

//--------------------เบิกจ่าย------------------------------------------------------------------------

router.get("/with-draw", async (req, res) => {
  try {
    const result = await service.findAllWdraw();
    res.json(result);
  } catch (ex) {
    res.error(ex);
  }
});

router.post("/add-wdraw",[
    check("draw_head_id", "โปรดใส่เลขที่จ่ายสิ่งของ / ส่งมอบ").not().isEmpty(),
    check("draw_department_id", "โปรดเลือกหน่วยงานที่รับมอบ").not().isEmpty(),
    check("amount", "โปรดกรอกจำนวนที่เป็นตัวเลขมากกว่า 0 เท่านั้น").not().isEmpty().isInt({ gt: 0 }),
    check("item_id", "โปรดเลือกรายการสิ่งของ").not().isEmpty(),
  ],
  async (req, res) => {
    try {
      req.validate();
      const checkinstock = await service.findBefore_insert(req.body.item_id);
      // console.log(checkinstock[0].remaining_instock );
      if (checkinstock[0].remaining_instock == "undefined") { res.status(400) .error({ message: `ไม่พบรายการรับบริจาคสิ่งของดังกล่าว` });
      } else if ( checkinstock[0].remaining_instock == null && checkinstock[0].amount_all >= req.body.amount) { res.json({ message: await service.insertWDraw(req.body) });
      } else if ( checkinstock[0].remaining_instock != null &&  checkinstock[0].remaining_instock >= req.body.amount ) {res.json({ message: await service.insertWDraw(req.body) });
      } else { 
        if(checkinstock[0].remaining_instock == null){
          res.status(400).error( { message: `จำนวนสินค้าไม่พอจ่าย คงเหลือทั้งหมด : ${checkinstock[0].amount_all} ${checkinstock[0].item_name_type}`});
        }else{
          res.status(400).error( { message: `จำนวนสินค้าไม่พอจ่าย คงเหลือทั้งหมด : ${checkinstock[0].remaining_instock} ${checkinstock[0].item_name_type}`});
        }
      }
    } catch (ex) {
      res.error(ex);
    }
  }
);

module.exports = router;
