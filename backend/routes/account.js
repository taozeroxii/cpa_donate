const router = require("express").Router();
const { check, query, validationResult } = require("express-validator");
const { onRegister } = require("../services/accountservice");
const services = require("../services/accountservice");

router.get("/", async (req, res) => {
  res.json({message:"account route"});
});

router.post("/register",[
  check('pname').not().isEmpty(),
  check('fname').not().isEmpty(),
  check('lname').not().isEmpty(),
  check('username').not().isEmpty(),
  check('password').not().isEmpty(),
  check('default_role').not().isEmpty().isInt(),
], async (req, res) => {
  try{
    req.validate();
    const create = await onRegister(req.body);
    res.json(create);
  }catch(ex){res.status(400).json({message:ex.message})}

});


router.post("/login",[
  check('username').not().isEmpty(),
  check('password').not().isEmpty(),
], async (req, res) => {
  try{
    req.validate();
    res.json(req.body);
  }catch(ex){res.status(400).json({message:ex.message})}

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
