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
            if (
              password_varify(
                value.password,
                userLogin.password,
                userLogin.salz
              )
            ) {
              // นำค่าที่พิมมาไปเช็คกับรหัสผ่านใน ฐานข้อมูล + salz ว่าตรงกันไหม
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

  getAlluserlist() {
    return new Promise((resolve, reject) => {
      connection.query(
        `select du.id,du.username,du.pname,du.fname,du.lname,du.default_role,dur.role from donate_user du left join donate_user_role dur on du.default_role = dur.id where du.id != 1 AND isuse = 'Y' ORDER BY du.id desc`,
        (error, result) => {
          // console.log(result);
          if (error) return reject(error);
          resolve(result);
        }
      );
    });
  },

  getUserByid(id) {
    return new Promise((resolve, reject) => {
      connection.query(
        `select du.id,du.username,du.pname,du.fname,du.lname,du.default_role ,dr.role
        from  donate_user du 
        LEFT OUTER JOIN donate_user_role dr on dr.id = du.default_role
        where du.id = ?`,
        [id],
        (error, res) => {
          if (error) return reject(error);
          resolve(res[0]);
        }
      );
    });
  },

  updateUserByid(id, value) {
    return new Promise((resolve, reject) => {
      // console.log(connection.escape(id));
      // console.log(value)
      salz = randomstring.generate(7);
      value.password = value.password + salz;
      value.password = password_hash(value.password);
      const $query = `UPDATE donate_user SET  username = ? , password = ? , pname    = ? , fname= ? , lname = ?,default_role = ?, staff_update = ? ,salz = ? WHERE id = ? `;
      // console.log(id);
      connection.query($query,[ value.username, value.password,  value.pname, value.fname, value.lname, value.default_role,value.staff_update,salz, id ],
        (error, result) => {
            if (error) return reject(error);
            resolve(result);
        }
      );
    });
  },

  deleteUser(id,value) {
    return new Promise((resolve, reject) => {
      connection.query(
        `UPDATE  donate_user SET isuse = 'N' ,staff_update = ? where id = ?`,
        [value.staff_update,id],
        (error, res) => {
          if (error) return reject(error);
          resolve(res);
        }
      );
    });
  },


};
