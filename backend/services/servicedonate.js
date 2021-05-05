const connection = require("../configs/mycon");

const table = {
  detail_donate: "donate_detail_io",
  user: "user",
};

module.exports = {
  

  findAllitemList() {//ช้อมูลรับบริจาคทั้งหมด
    return new Promise((resolve, reject) => {
      connection.query(
        `SELECT * FROM ${table.detail_donate} where status_inout = 'IN'`,
        (error, result) => {
          if (error) return reject(error);
          resolve(result.rows);
        }
      );
    });
  },
  
  findDonateInBygroup(id) {//ช้อมูลรับบริจาคทั้งหมด
    return new Promise((resolve, reject) => {
      connection.query(
        `SELECT * FROM ${table.detail_donate} where status_inout = 'IN' AND item_type_id = = ? `[id],
        (error, result) => {
          if (error) return reject(error);
          resolve(result.rows);
        }
      );
    });
  },

  findDetaildonateByid() {},

  insertDetaildonate() {},

  updateDetaildonate() {},

  deleteDetaildonate() {},
};
