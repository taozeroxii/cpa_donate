const connection = require("../configs/mycon");

const table = {
  // service  select insert update delete item รายการสินค้า
  group_type: "donate_group_type", // กลุ่มรายการสินค้า
  itemtype: "donate_item_type", // หน่วยนับ
  itemlist: "donate_item_list", // รายการสินค้า
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
  onAddgroupItem(value) {
    return new Promise((resolve, reject) => {
      connection.query(
        `INSERT INTO ${table.group_type} SET ? `,
        value,
        (error, result) => {
          if (error) return reject(error);
          resolve(result);
        }
      );
    });
  },
  onEditgroupItem(value) {
    return new Promise((resolve, reject) => {
      connection.query(
        `INSERT INTO ${table.group_type} SET ? `,
        value,
        (error, result) => {
          if (error) return reject(error);
          resolve(result);
        }
      );
    });
  },
  onDeletegroupItem(value) {
    return new Promise((resolve, reject) => {
      connection.query(
        `INSERT INTO ${table.group_type} SET ? `,
        value,
        (error, result) => {
          if (error) return reject(error);
          resolve(result);
        }
      );
    });
  },

  //  ประเภทรายการสินค้าหน่วยนับ    -------- ---------------------------------------------------
  findItemtype() {
    return new Promise((resolve, reject) => {
      connection.query(
        `SELECT * FROM ${table.itemtype} ORDER BY item_type_id desc`,
        (error, result) => {
          if (error) return reject(error);
          resolve(result);
        }
      );
    });
  },
  findItemtypeByid(id) {
    return new Promise((resolve, reject) => {
      connection.query(
        `SELECT * FROM donate_item_type where item_type_id = ? `,
        [id],
        (error, result) => {
          if (error) return reject(error);
          resolve(result.length > 0 ? result[0] : null);
        }
      );
    });
  },
  onAddItemType(value) {
    return new Promise((resolve, reject) => {
      value.insertdatetime = new Date();
      connection.query(
        `INSERT INTO ${table.itemtype} SET ? `,
        value,
        (error, result) => {
          if (error) return reject(error);
          resolve(result);
        }
      );
    });
  },
  EditGroupitemByid(id, value) {
    return new Promise((resolve, reject) => {
      const $query = `UPDATE donate_item_type SET  item_name_type = ? , note = ? ,staff_update = ? WHERE item_type_id = ? `;
      //  console.log(value);
      connection.query(
        $query,
        [value.item_name_type, value.note, value.staff_update, id],
        (error, result) => {
          if (error) return reject(error);
          resolve(result);
        }
      );
    });
  },

  // function item list รายการสินค้ารับบริจาคทั้งหมด ---------------------------------------------------
  findItemList() {
    return new Promise((resolve, reject) => {
      // resolve("test");
      connection.query(
        `
        SELECT *,itemlist.all_donate - itemlist.all_widthdraw as remaining_instock
        FROM(
          SELECT dil.item_id,dil.item_name,dit.item_name_type,dgt.type_name as group_type,
          (	SELECT sum(amount)as wd_all FROM donate_detail_instock where item_id = dil.item_id )as all_donate,
          (	SELECT sum(amount)as wd_all FROM donate_detail_wdraw where item_id = dil.item_id )as all_widthdraw
          ,dil.insert_date,dil.update_date
             FROM donate_item_list dil 
             INNER JOIN donate_group_type dgt on dgt.group_item_type_id = dil.group_item_type_id
             INNER JOIN donate_item_type dit on dit.item_type_id = dil.item_type_id
             ORDER BY dil.update_date desc
        )as itemlist `,(error, result) => {
          if (error) return reject(error);
          resolve(result);
        }
      );
    });
  },

  findItemListByid(id) {
    //ดึงข้อมูลตามid แก้ไขรายการ
    return new Promise((resolve, reject) => {
      connection.query(
        `SELECT dil.item_id,dil.item_type_id,dil.group_item_type_id,dil.item_name,dit.item_name_type,dgt.type_name FROM donate_item_list  dil
         LEFT OUTER JOIN donate_item_type dit on dil.item_type_id = dit.item_type_id
         LEFT OUTER JOIN donate_group_type dgt on dgt.group_item_type_id = dil.group_item_type_id where dil.item_id = ? `,
        [id],
        (error, result) => {
          if (error) return reject(error);
          resolve(result.length > 0 ? result[0] : null);
        }
      );
    });
  },

  findItemListBygroupId(id) {
    // หาไอเท็มตามกลุ่มรายการสินค้า
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

  onAdditemlist(value) {
    // เพิ่มรายการสินค้า
    return new Promise((resolve, reject) => {
      value.insert_date = new Date();
      connection.query(
        `INSERT INTO ${table.itemlist} SET ? `,
        value,
        (error, result) => {
          if (error) return reject(error);
          resolve(result);
        }
      );
    });
  },

  findallusergroup() {
    return new Promise((resolve, reject) => {
      // value.insert_date = new Date();
      connection.query(`SELECT * FROM donate_user_role `, (error, result) => {
        if (error) return reject(error);
        resolve(result);
      });
    });
  },

  checkitem_item_draw(id) { //เช็คว่ารายการสินค้านี้เคยถูกเบิกไปแล้วหรือยังถ้าเบิกไปแล้วให้ไม่สามารถแก้ไขได้
    return new Promise((resolve, reject) => {
      connection.query(
        `SELECT * FROM donate_detail_wdraw where item_id = ? `,[id],
        (error, result) => {
          if (error) return reject(error);
          resolve(result.length > 0 ? result : null);
        }
      );
    });
  },

  updateItemList(id, value) {
    return new Promise((resolve, reject) => {
      const $query = `UPDATE donate_item_list SET  group_item_type_id = ? ,item_name = ? , item_type_id = ? ,staff_update = ? WHERE item_id = ? `;
      // console.log(value);
      connection.query( $query,[value.group_item_type_id, value.item_name,value.item_type_id, value.staff_update,id,],
        (error, result) => {
          if (error) return reject(error);
          resolve(result);
        }
      );
    });
  },

  // WORK GROUP ------------------------------------------------------------------------------------
  findWorkGroup() {
    return new Promise((resolve, reject) => {
      connection.query(
        `SELECT * FROM hr_cpa_workgroup ORDER BY id`,
        (error, result) => {
          if (error) return reject(error);
          resolve(result);
        }
      );
    });
  },

  // function Detai lHead  เลขที่ใบ ---------------------------------------------------
  findheadnumber(value) {
    return new Promise((resolve, reject) => {
      // value.insert_date = new Date();
      connection.query(
        `SELECT * FROM donate_detail_head WHERE donate_head_id =  ? `,
        value,
        (error, result) => {
          if (error) return reject(error);
          resolve(result);
        }
      );
    });
  },
};
