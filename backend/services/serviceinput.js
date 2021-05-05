const connection = require("../configs/mycon");

const table = {
  group_type: "donate_group_type",
  itemtype: "item_type",
};

module.exports = {
  findGroupitem() {
    //ช้อมูลรับบริจาคทั้งหมด
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

  findItemtype() {
    //ช้อมูลรับบริจาคทั้งหมด
    return new Promise((resolve, reject) => {
      connection.query(
        `SELECT * FROM ${table.itemtype} `,
        (error, result) => {
          if (error) return reject(error);
          resolve(result);
        }
      );
    });
  },




};
