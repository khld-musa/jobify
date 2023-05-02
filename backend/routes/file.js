const express = require('express')
const router = express.Router();


const {
getUserCv,
getBokImages
} = require('../controllers/fileController')

const { isAuthenticatedUser, authorizeRoles } = require('../middlewares/auth');


router.route('/productImages/:file').get(getUserCv);

router.route('/bokImages/:file').get(getBokImages);

module.exports = router;