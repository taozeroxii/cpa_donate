const connection = require("../configs/mycon");
const { password_hash, password_varify } = require("../configs/security");
var randomstring = require("randomstring");
const { connect } = require("../configs/mycon");

module.exports = {
  onRegister(value) {
    return new Promise((resolve, reject) => {
      // console.log(randomstring.generate(7));
      value.salz = randomstring.generate(7);
      value.password = value.password + value.salz;
      value.insertdatetime = new Date();
      value.password = password_hash(value.password);
      connection.query(
        `select username from donate_user where username =  ?`,
        value.username,
        (error, result) => {
          if (error) return reject(error);
          const haveuser = result[0];
          if (haveuser) {
            reject({ message: "เคยมี Username นี้แล้วในระบบ" });
          } else {
            // หากไม่มีให้ insert
            connection.query(
              `INSERT INTO donate_user SET ?`,
              value,
              (error, result) => {
                if (error) return reject(error);
                resolve(result);
              }
            );
          }
        }
      );
    });
  },

  //login
  onLogin(value) {
    return new Promise((resolve, reject) => {
      // resolve(value)
      connection.query(
        "SELECT du.*,dur.role as default_role_name FROM `donate_user` du LEFT JOIN donate_user_role dur on du.default_role = dur.id where username = ?",
        [value.username],
        (error, result) => {
          //bind params เพื่อกัน sql injection ด้วย ? [value.username]
          if (error) return reject(error);
          if (result.length > 0) {
            const userLogin = result[0];
            if ( password_varify( value.password, userLogin.password,userLogin.salz )) {// นำค่าที่พิมมาไปเช็คกับรหัสผ่านใน ฐานข้อมูล + salz ว่าตรงกันไหม
              delete userLogin.password;
              delete userLogin.salz;
              delete userLogin.insertdatetime;
              delete userLogin.update_datetime;
              return resolve(userLogin);
            }
          }
          reject(new Error("Username หรือ Password ไม่ถูกต้อง"));
        }
      );
    });
  },

  getAlluserlist(){
    return new Promise ((resolve,reject)=>{
      connection.query(`select du.id,du.username,du.pname,du.fname,du.lname,du.default_role,dur.role from donate_user du left join donate_user_role dur on du.default_role = dur.id`
      ,(error, result) => {
        // console.log(result);
        if (error) return reject(error);
        resolve(result)
      })
    })
  },
  
};
