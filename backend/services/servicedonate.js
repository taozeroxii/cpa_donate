const { default: axios } = require("axios");
const connection = require("../configs/mycon");

const table = {
  // service  select insert update delete item ข้อมูลรายการรับจ่ายสินค้า
  detail_donatein: "donate_detail_instock", // รับเข้า
  detail_donateout: "donate_detail_wdraw", // จ่ายให้
};

module.exports = {
  //---------------------------- ข้อมูลรับเข้าบริจาค --------------------------------------
  findAllDonateList() {
    //ช้อมูลรับบริจาคทั้งหมด
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

  findOneDonatelist(id) {
    //ข้ออมูลรับบริจาคตาม id
    return new Promise((resolve, reject) => {
      connection.query(
        `SELECT ddi.*,dil.group_item_type_id,dgt.type_name as group_item_type_name,dd.donor_name as  donor,
        dil.item_name as  item
        FROM donate_detail_instock ddi
        INNER JOIN donate_donor dd on dd.donor_id = ddi.donor_id
        INNER JOIN donate_item_list dil on dil.item_id = ddi.item_id
        INNER JOIN donate_group_type dgt on dgt.group_item_type_id = dil.group_item_type_id
        where  id =  ? `,[id],(error, result) => {
          if (error) return reject(error);
          // console.log(result)
          resolve(result[0]);
        }
      );
    });
  },


  findDonateInBygroup(id) {
    //ข้ออมูลรับบริจาคตาม id
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
      connection.query(
        `INSERT INTO donate_detail_instock SET ?`,
        value,
        (err, result) => {
          if (err) return reject(err);
          resolve(result);
        }
      );
    });
  },

  //--------------------------------------------------------------------------------

  findAllDonor() {
    return new Promise((resolve, reject) => {
      connection.query(`SELECT * FROM donate_donor`, (error, result) => {
        if (error) return reject(error);
        resolve(result);
      });
    });
  },

  //---------------------------- ข้อมูลบริจาคให้หน่วยงาน --------------------------------------
  findAllWdraw() {
    return new Promise((resolve, reject) => {
      connection.query(`SELECT dw.draw_head_id,dw.draw_id,dw.draw_date,dgt.type_name,dil.item_name,dw.amount,dit.item_name_type,
      hcg.mission_name,dd.workgroup, dw.status
      FROM donate_detail_wdraw dw 
      LEFT OUTER JOIN donate_group_type dgt on dgt.group_item_type_id = dw.groupstock_id
      LEFT OUTER JOIN donate_item_list dil on dil.item_id =  dw.item_id
      LEFT OUTER JOIN donate_item_type dit on dit.item_type_id = dil.item_type_id
      LEFT OUTER JOIN hr_cpa_workgroup dd  on dd.id =  dw.draw_department_id
      LEFT OUTER JOIN hr_cpa_mission hcg on hcg.mission_id = dd.mission_id ORDER BY dw.draw_id desc`, (error, result) => {
        if (error) return reject(error);
        resolve(result);
      });
    });
  },

  findBefore_insert(id){//เช็คจำนวนสิ่งของก่อนทำการเพิ่มลงฐานข้อมูล มีข้อมูลรับเข้าทั้งหมดจ่ายออกทั้งหมดและคงเหลือ
    return new Promise((resolve, reject) => {
      connection.query(
        `SELECT *,ck_item.amount_all - ck_item.all_widthdraw as remaining_instock  
         FROM(
          SELECT  ddi.item_id,dil.item_name,dit.item_name_type,sum(ddi.amount)as amount_all,
          (	SELECT sum(amount)as wd_all FROM donate_detail_wdraw where item_id = ddi.item_id )as all_widthdraw
          FROM donate_detail_instock ddi 
          LEFT JOIN donate_item_list dil on ddi.item_id = dil.item_id
          LEFT JOIN donate_item_type dit on dit.item_type_id = dil.item_type_id
          WHERE  ddi.item_id = ?
          GROUP BY ddi.item_id,dil.item_name)as ck_item`,[id],(error, result) => {
          if (error) return reject(error);
          resolve(result);
        }
      );
    });
  },

  insertWDraw(value) {
    return new Promise((resolve, reject) => {
      value.draw_date = new Date();
      value.status = "Y";
      connection.query(`INSERT INTO donate_detail_wdraw SET ?`, value,(err, result) => {
          if (err) return reject(err);
          resolve(result);
        }
      );
    });
  },


  //--------------------------- ผู้บริจาค
  insertDonor(value){
    return new Promise((resolve, reject) => {
      value.insertdate_time = new Date();
      value.status = "Y";
      connection.query(`INSERT INTO donate_donor SET ?`, value,(err, result) => {
          if (err) return reject(err);
          resolve(result);
        }
      );
    });
  },
  editDonor(id,value){
    return new Promise((resolve, reject) => {
      connection.query(`UPDATE donate_donor SET ? WHERE donor_id = ?`, [value,id],(err, result) => {
          if (err) return reject(err);
          resolve(result);
        }
      );
    });
  },
  finddonorlistByid(id){
    return new Promise((resolve, reject) => {
      connection.query(
         `SELECT * FROM donate_donor where donor_id = ?`,[id],(error, result) => {
          if (error) return reject(error);
          resolve(result[0]);
        }
      );
    });
  }


};
