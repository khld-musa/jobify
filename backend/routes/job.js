// const express = require('express')
// const router = express.Router();


// const {
//     getJobs,
//     newJob,
//     updateJob,
//     deleteJob,

// } = require('../controllers/jobController')

// const { isAuthenticatedUser, authorizeRoles } = require('../middlewares/auth');


// router.route('/jobs').get(isAuthenticatedUser, getJobs);

// router.route('/admin/job/new').post(isAuthenticatedUser, authorizeRoles('admin'), newJob);

// router.route('/admin/job/:id')
//     .put(isAuthenticatedUser, authorizeRoles('admin'), updateJob)
//     .delete(isAuthenticatedUser, authorizeRoles('admin'), deleteJob);


// module.exports = router;



const express = require('express')
const router = express.Router();


const {
    getJobs,
    getAdminJobs,
    newJob,
    getSingleJob,
    updateJob,
    deleteJob,

} = require('../controllers/jobController')

const { isAuthenticatedUser, authorizeRoles } = require('../middlewares/auth');


router.route('/jobs').get(getJobs);
router.route('/admin/jobs').get(getAdminJobs);
router.route('/job/:id').get(getSingleJob);

router.route('/admin/job/new').post(isAuthenticatedUser, authorizeRoles('admin'), newJob);

router.route('/admin/job/:id')
    .put(isAuthenticatedUser, authorizeRoles('admin'), updateJob)
    .delete(isAuthenticatedUser, authorizeRoles('admin'), deleteJob);

module.exports = router;