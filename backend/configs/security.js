const crypto = require("crypto");

const security = {
  password_hash(password) {
    return crypto
      .createHash("sha1")
      .update(password)
      .digest("hex");
  },
  password_varify(password, password_hash, salz) {
    return security.password_hash(password + salz) === password_hash;
  },

  //ตรวจสอบการเข้าระบบ
  authenticated(req, res, next) {
    //    req.session.userLogin = {
    //         "u_id": 7,
    //         "u_username": "admin",
    //         "u_firstname": "admin",
    //         "u_lastname": "tao",
    //         "u_role": "admin"
    //     }

    try {
      if (req.session.userLogin) {
        return next();
      }
      throw new Error("Unauthorized");
    } catch (ex) {
      res.error(ex, 401);
    }
  },
  // ตรวจสอบการเข้าถึงหน้า
  isInRoles(roles = []) {
    return function(req, res, next) {
      //console.log(req.session.userLogin)
      try {
        if (roles.indexOf(req.session.userLogin.u_role) >= 0) return next();
        throw new Error("Forbidden");
      } catch (ex) {
        res.status(403).json({ message: ex.message });
      }
    };
  },
};

module.exports = security;
