const express = require("express");
var cors = require('cors')
const server = express();
const bodyParser = require('body-parser')
const PORT = 3000;
const routes = require('./routes');

server.use(cors())

//ปกป้อง HTTP HEADER ด้วย Helmet
var helmet = require('helmet')
server.use(helmet())

server.use(require('./configs/middleware'));//เรียกใช้งานไฟล์ middleware ที่เขียนไว้ดัก error message ต่างๆ
server.use(bodyParser.urlencoded({ extended: false,limit:'500MB' }));
server.use(bodyParser.json({limit:'500MB'}));// parser ตัวแปรที่ถูกส่งเข้ามาจาก client ถ้าไม่ใส่จะทำให้ backend ไม่รู้ว่าเป็นประเภทไหน

//เรียกใช้งาน routes
server.use('/api',routes);
server.get('*', (req, res) => {
    res.end(`backend server is started`);
})
server.listen(PORT, () => console.log(`sever started port: ${PORT} . `));
