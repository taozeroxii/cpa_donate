const connection = require("../configs/mycon");

const table = { // service  select insert update delete item ข้อมูลรายการรับจ่ายสินค้า
  detail_donatein: "donate_detail_instock", // รับเข้า
  detail_donateout: "donate_detail_wdraw",  // จ่ายให้
};

module.exports = {
  

  findAllitemList() {//ช้อมูลรับบริจาคทั้งหมด
    return new Promise((resolve, reject) => {
      connection.query(
        `SELECT * FROM ${table.detail_donatein}`,
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
        `SELECT * FROM ${table.detail_donatein} where  item_type_id = ? `[id],
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
