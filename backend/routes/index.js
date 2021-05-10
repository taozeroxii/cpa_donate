const router = require('express').Router();
// const { authenticated,isInRoles } = require('../configs/security');

//ข้อมูลกลุ่มประเภทของรับบริจาค router
router.use('/typeinput',require('./type_input'));// จัดการข้อมูลรายการสินค้าและหน่วยสินค้าต่างๆ
router.use('/donate',require('./donate'));// จัดการข้อมูลการรับบริจาคหรือจ่ายให้หน่วยงาน
router.use('/account',require('./account'));



// //equipment
// router.use('/equipment',authenticated,isInRoles(['admin']),require('./equipment'));

// //room
// router.use('/room',authenticated,isInRoles(['admin']),require('./room'));

// //room
// router.use('/booking',authenticated,require('./booking'));

module.exports = router;