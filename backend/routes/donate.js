const router = require("express").Router();
const { check, query } = require("express-validator");
const service = require("../services/servicedonate");

router.get("/", (req, res) => {
  res.json({ message: "donate route" });
});

//--------------------แสดงข้อมูลรับบริจาคทั้งหมด------------------------------------------------------------------------
router.get("/donatelist",async (req, res) => {
  try{
    const result = await service.findAllDonateList();
    res.json(result);
  }catch(ex){
    res.error(ex);
  }
});
router.post( //เพิ่มข้อมูลรับบริจาค
    "/add-donate",[
    check("donate_head_id","โปรดใส่เลขที่รับบริจาค").not().isEmpty(),
    check("donor_id","โปรดเลือกผู้รับบริจาค").not().isEmpty(),
    check("amount","โปรดกรอกจำนวนที่เป็นตัวเลขเท่านั้น").not().isEmpty().isInt(),
    check("item_id","โปรดเลือกรายการสิ่งของ").not().isEmpty(),
  ],
    async (req, res) => {
      try {
        req.validate();
        res.json({ message: await service.insertDetaildonate(req.body) });
      } catch (ex) {
        res.error(ex);
      }
    }
  );

  router.get("/donorlist",async (req, res) => {
    try{
      const result = await service.findAllDonor();
      res.json(result);
    }catch(ex){
      res.error(ex);
    }
  });

module.exports = router;
