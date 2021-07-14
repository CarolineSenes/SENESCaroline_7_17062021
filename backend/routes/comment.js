////////// contient logique de routing pour comment //////////

const express = require("express");
const router = express.Router();

const auth = require("../middleware/auth");
const commentCtrl = require("../controllers/comment");

// CRUD Routes
router.post("/:id/comment", auth, commentCtrl.createComment);
router.delete("/:id/comment/:id", auth, commentCtrl.deleteComment);

module.exports = router;
