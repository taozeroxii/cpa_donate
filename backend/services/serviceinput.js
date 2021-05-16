const connection = require("../configs/mycon");

const table = { // service  select insert update delete item รายการสินค้า
  group_type: "donate_group_type",// กลุ่มรายการสินค้า
  itemtype: "donate_item_type",   // หน่วยนับ
  itemlist: "donate_item_list",   // รายการสินค้า
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
    onAddgroupItem(value){
      return new Promise((resolve, reject) => {
        connection.query(
          `INSERT INTO ${table.group_type} SET ? `,value,(error, result) => {
            if (error) return reject(error);
            resolve(result);
          }
        );
      });
    },
    onEditgroupItem(value){
      return new Promise((resolve, reject) => {
        connection.query(
          `INSERT INTO ${table.group_type} SET ? `,value,(error, result) => {
            if (error) return reject(error);
            resolve(result);
          }
        );
      });
    },

    onDeletegroupItem(value){
      return new Promise((resolve, reject) => {
        connection.query(
          `INSERT INTO ${table.group_type} SET ? `,value,(error, result) => {
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

  findItemListByid(id) {  //ดึงข้อมูลตามid แก้ไขรายการ
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

  findItemListBygroupId(id){  // หาไอเท็มตามกลุ่มรายการสินค้า 
    return new Promise((resolve, reject) => {
      connection.query(
        `SELECT dil.*,dit.item_name_type from donate_item_list dil  inner join  donate_item_type dit on dil.item_type_id = dit.item_type_id  where dil.group_item_type_id = ? `,
        [id],
        (error, result) => {
          if (error) return reject(error);
          resolve(result.length > 0 ? result : null);
        }
      );
    });
  },

  onAdditemlist(value){   // เพิ่มรายการสินค้า
    return new Promise((resolve, reject) => {
      value.insert_date = new Date();
      connection.query(
        `INSERT INTO ${table.itemlist} SET ? `,value,(error, result) => {
          if (error) return reject(error);
          resolve(result);
        }
      );
    });
  },






};
