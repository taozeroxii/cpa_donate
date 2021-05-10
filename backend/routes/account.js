const router = require("express").Router();
const { check, query, validationResult } = require("express-validator");
const services = require("../services/accountservice");

router.get("/", async (req, res) => {
  res.json({message:"account route"});
});

router.post("/register",[
  check('pname','โปรดกรอกคำนำหน้า').not().isEmpty(),
  check('fname','โปรดกรอกชื่อ').not().isEmpty(),
  check('lname','โปรดกรอกนามสกุล').not().isEmpty(),
  check('username','โปรดกรอก username').not().isEmpty(),
  check('password','โปรดกรอก password').not().isEmpty(),
  check('default_role').not().isEmpty().isInt(),
], async (req, res) => {
  try{
    // console.log(req.body)
    req.validate();
    const create = await services.onRegister(req.body);
    res.json(create);
  }catch(ex){res.status(400).json({message:ex.message})}

});


router.post("/login",[
  check('username').not().isEmpty(),
  check('password').not().isEmpty(),
], async (req, res) => {
  try{
    req.validate();
    const userLogin = await services.onLogin(req.body);
    // req.session.userLogin = userLogin;//เก็บ session เมื่อ login สำเร็จ
    res.json(userLogin);
  }catch(ex){res.status(400).json({message:ex.message})}
});



router.get("/edit-user/:id", async (req, res) => {
  //   try {
  //     const model = await services.findById(req.params.id);
  //     if (!model) throw new Error("ไม่พบข้อมูลที่ค้นหา");
  //     res.json(model);
  //   } catch (ex) {
  //     res.error(ex);
  //   }
});

module.exports = router;
