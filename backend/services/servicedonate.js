const { default: axios } = require("axios");
const connection = require("../configs/mycon");

const table = { // service  select insert update delete item ข้อมูลรายการรับจ่ายสินค้า
  detail_donatein: "donate_detail_instock", // รับเข้า
  detail_donateout: "donate_detail_wdraw",  // จ่ายให้
};

module.exports = {

  //---------------------------- ข้อมูลรับเข้าบริจาค --------------------------------------
  findAllDonateList() {//ช้อมูลรับบริจาคทั้งหมด
    return new Promise((resolve, reject) => {
      // resolve("test");
      connection.query(
        `SELECT ddi.donate_head_id as donate_head_id,ddi.id as donate_id,ddn.donor_name as donor,dil.item_name,ddi.amount,dit.item_name_type,dgt.type_name,ddi.insert_date
        FROM ${table.detail_donatein} as ddi 
        INNER JOIN donate_item_list dil on ddi.item_id = dil.item_id
        INNER JOIN donate_group_type dgt on dgt.group_item_type_id = dil.group_item_type_id
        LEFT JOIN donate_donor ddn on ddn.donor_id = ddi.donor_id
        INNER JOIN donate_item_type dit on dit.item_type_id = dil.item_type_id ORDER BY ddi.id desc`,
        (error, result) => {
          if (error) return reject(error);
          resolve(result);
        }
      );
    });
  },
  
  findDonateInBygroup(id) {//ข้ออมูลรับบริจาคตาม id
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

  insertDetaildonate(value) {
    return new Promise((resolve, reject) => {
        value.insert_date = new Date();
        connection.query(`INSERT INTO donate_detail_instock SET ?`,value,(err,result)=>{
          if(err) return reject(err)
          resolve(result)
        })
    })
  },

  updateDetaildonate() {},

  deleteDetaildonate() {},
  //--------------------------------------------------------------------------------

  findAllDonor(){ return new Promise((resolve, reject) => {
    connection.query(
      `SELECT * FROM donate_donor`,(error, result) => {
        if (error) return reject(error);
        resolve(result);
      }
    );
  });
  }

  

  
};
