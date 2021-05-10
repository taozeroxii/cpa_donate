const connection = require ('../configs/mycon')
const {password_hash} = require('../configs/security')
var randomstring = require("randomstring");

module.exports = {
    onRegister(value){
        return new Promise((resolve,reject)=>{
            // console.log(randomstring.generate(7));
            value.salz = randomstring.generate(7)
            value.password = value.password + value.salz;
            value.insertdatetime = new Date();
            value.password = password_hash(value.password);
            connection.query(`select username from donate_user where username =  ?`,value.username,(error,result)=>{
                if(error) return reject(error);
                const haveuser = result[0];
                if(haveuser){
                    reject({message:"เคยมี Username นี้แล้วในระบบ"})
                }else{// หากไม่มีให้ insert
                    connection.query(`INSERT INTO donate_user SET ?`,value,(error,result)=>{
                        if(error) return reject(error);
                         resolve(result);
                    })
                }
            });   
        })
    }
}