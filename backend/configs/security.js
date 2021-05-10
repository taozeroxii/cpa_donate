const crypto = require("crypto");

const security = {
  password_hash(password) {
    return crypto.createHash("sha1").update(password).digest("hex");
  },
  password_varify(password,password_hash,salz){
    return security.password_hash(password+salz) === password_hash;
  }
};

module.exports = security;