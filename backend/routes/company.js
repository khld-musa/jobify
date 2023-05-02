const express = require('express')
const router = express.Router();


const {
    getAdminCompanies,
    newCompany,
    getSingleCompany,
    updateCompany,
    deleteCompany,

} = require('../controllers/companyController')

const { isAuthenticatedUser, authorizeRoles } = require('../middlewares/auth');



router.route('/admin/companies').get(isAuthenticatedUser, getAdminCompanies);
router.route('/Company/:id').get(isAuthenticatedUser, getSingleCompany);

router.route('/admin/company/new').post(isAuthenticatedUser, authorizeRoles('admin'), newCompany);

router.route('/admin/company/:id')
    .put(isAuthenticatedUser, authorizeRoles('admin'), updateCompany)
    .delete(isAuthenticatedUser, authorizeRoles('admin'), deleteCompany);


module.exports = router;