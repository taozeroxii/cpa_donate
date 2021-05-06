const connection = require("../configs/mycon");

const table = {
  group_type: "donate_group_type",
  itemtype: "donate_item_type",
  itemlist: "donate_item_list",
};

module.exports = {
  //  กลุ่มรายการสินค้ารับบริจาคทั้งหมด ---------------------------------------------------
  findGroupitem() {
    return new Promise((resolve, reject) => {
      connection.query(
        `SELECT * FROM ${table.group_type} `,
        (error, result) => {
          if (error) return reject(error);
          resolve(result);
        }
      );
    });
  },
  //  ประเภทรายการสินค้า    -------- ---------------------------------------------------
  findItemtype() {
    return new Promise((resolve, reject) => {
      connection.query(`SELECT * FROM ${table.itemtype} `, (error, result) => {
        if (error) return reject(error);
        resolve(result);
      });
    });
  },

  // function item list รายการสินค้ารับบริจาคทั้งหมด ---------------------------------------------------
  findItemList() {
    return new Promise((resolve, reject) => {
      connection.query(`SELECT * FROM ${table.itemlist} `, (error, result) => {
        if (error) return reject(error);
        resolve(result);
      });
    });
  },
  findItemListByid(id) {//ดึงข้อมูลตามid แก้ไขรายการ
    return new Promise((resolve, reject) => {
      connection.query(
        `SELECT * FROM ${table.itemlist} where item_id = ? `,
        [id],
        (error, result) => {
          if (error) return reject(error);
          resolve(result.length > 0 ? result[0] : null);
        }
      );
    });
  },
};
