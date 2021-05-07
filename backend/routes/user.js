const router = require("express").Router();
// const services = require("../services/menuservice");

router.get("/", async (req, res) => {
  res.json("model");
});

router.get("/submenu/:id", async (req, res) => {
  //   try {
  //     const model = await services.findById(req.params.id);
  //     if (!model) throw new Error("ไม่พบข้อมูลที่ค้นหา");
  //     res.json(model);
  //   } catch (ex) {
  //     res.error(ex);
  //   }
});

module.exports = router;
