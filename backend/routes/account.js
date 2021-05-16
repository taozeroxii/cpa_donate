const router = require("express").Router();
const { check, query, validationResult ,param} = require("express-validator");
const services = require("../services/accountservice");

router.get("/", async (req, res) => {
  res.json({ message: "account route" });
});

router.post( "/register",
  [
    check("pname", "โปรดกรอกคำนำหน้า") .not().isEmpty(),
    check("fname", "โปรดกรอกชื่อ").not().isEmpty(),
    check("lname", "โปรดกรอกนามสกุล").not().isEmpty(),
    check("username", "โปรดกรอก username").not().isEmpty(),
    check("password", "โปรดกรอก password") .not().isEmpty(),
    check("default_role") .not().isEmpty() .isInt(),
  ],
  async (req, res) => {
    try {
      // console.log(req.body)
      req.validate();
      const create = await services.onRegister(req.body);
      res.json(create);
    } catch (ex) {
      res.status(400).json({ message: ex.message });
    }
  }
);

router.post( "/login",
  [
    check("username") .not().isEmpty(),
    check("password").not() .isEmpty(),
  ],
  async (req, res) => {
    try {
      req.validate();
      const userLogin = await services.onLogin(req.body);
      req.session.userLogin = userLogin; //เก็บ ข้อมูล user ทั้งหมด ลง session เมื่อ login สำเร็จ
      res.json(userLogin);
    } catch (ex) {
      res.status(400).json({ message: ex.message });
    }
  }
);

router.get("/getuserlist", async (req, res) => {
  try {
    const model =  await services.getAlluserlist();
    if (!model) throw new Error("ไม่พบข้อมูลที่ค้นหา");
    res.json(model);
  } catch (ex) {
    res.error(ex);
  }
});

//ดึง user เพื่อ login และเก็บลง session
router.post("/getUserLogin", (req, res) => {
  try {
    if (req.session.userLogin) {
      return res.json(req.session.userLogin);
    }
    throw new Error('Unauthorize ..')
  } catch (ex) {
    res.error(ex, 401);
  }
});

router.post( "/logout",(req,res)=>{
  try{
    delete req.session.userLogin;
    res.json({message:"Logout"})
  }catch(ex){
    res.error(ex);
  }
});

router.get("/get-user/:id", async (req, res) => {
    try {
      const model = await services.getUserByid(req.params.id);
      if (!model) throw new Error("ไม่พบข้อมูลที่ค้นหา");
      res.json(model);
    } catch (ex) {
      res.error(ex);
    }
});


router.put("/edit-user/:id",[
  param('id').isInt(),// check param id from url ต้องเป็น int
  check('username').not().isEmpty(),
  check('password').not().isEmpty(),
  check('pname').not().isEmpty(),
  check('fname').not().isEmpty(),
  check('lname').not().isEmpty(),
  check('default_role').not().isEmpty()
], async (req, res) => {
  try {
    req.validate();
    const finduser = await services.getUserByid(req.params.id);
    // console.log(finduser)
    if (!finduser) throw new Error("ไม่พบข้อมูลที่ค้นหา");
    res.json(await services.updateUserByid(finduser.id,req.body));
  } 
  catch (ex) { res.error(ex);
  }
});



router.delete("/delete-user/:id",[
  param('id').isInt(),// check param id from url ต้องเป็น int
], async (req, res) => {
  try {
    req.validate();
    const finduser = await services.getUserByid(req.params.id);
    // console.log(finduser)
    if (!finduser) throw new Error("ไม่พบข้อมูลที่ค้นหา");
    res.json(await services.deleteUser(finduser.id,req.body));
  } 
  catch (ex) { res.error(ex);
  }
});



module.exports = router;
