const Job = require("../models/job");

const ErrorHandler = require("../utils/errorHandler");
const catchAsyncErrors = require("../middlewares/catchAsyncErrors");
const APIFeatures = require("../utils/apiFeatures");

// Create new job   =>   /api/v1/admin/job/new
exports.newJob = catchAsyncErrors(async (req, res, next) => {
  try {
    const { company, title, requirements, resposibilities, description } =
      req.body;
    const jobCount = await Job.countDocuments();
    const job = await Job.create({
      title,
      company,
      resposibilities,
      description,
      requirements,
      jobCount,
    });

    res.status(200).json({
      success: true,
      job,
    });
  } catch (err) {
    next(err);
  }
});

// Get all products   =>   /api/v1/jobs?keyword=apple
exports.getJobs = catchAsyncErrors(async (req, res, next) => {

  const resPerPage = 4;
  const jobsCount = await Job.countDocuments();

  const apiFeatures = new APIFeatures(Job.find(), req.query)
      .search()
      .filter()

  let jobs = await apiFeatures.query;
  let filteredJobsCount = jobs.length;

  apiFeatures.pagination(resPerPage)



  res.status(200).json({
      success: true,
      jobsCount,
      resPerPage,
      filteredJobsCount,
      jobs
  })

})

// Get all jobs (Admin)  =>   /api/v1/admin/jobs
exports.getAdminJobs = catchAsyncErrors(async (req, res, next) => {
  const jobs = await Job.find();

  res.status(200).json({
    success: true,
    jobs,
  });
});

// Get single job details   =>   /api/v1/job/:id
exports.getSingleJob = catchAsyncErrors(async (req, res, next) => {
  const job = await Job.findById(req.params.id);

  if (!job) {
    return next(new ErrorHandler("job not found", 404));
  }

  res.status(200).json({
    success: true,
    job,
  });
});

// Update job   =>   /api/v1/admin/job/:id
exports.updateJob = catchAsyncErrors(async (req, res, next) => {
  let job = await Job.findById(req.params.id);

  if (!job) {
    return next(new ErrorHandler("Job not found", 404));
  }

  job = await Job.findByIdAndUpdate(req.params.id, req.body, {
    new: true,
    runValidators: true,
    useFindAndModify: false,
  });

  res.status(200).json({
    success: true,
    job,
  });
});

// Delete job   =>   /api/v1/admin/job/:id
exports.deleteJob = catchAsyncErrors(async (req, res, next) => {
  const job = await Job.findById(req.params.id);

  if (!job) {
    return next(new ErrorHandler("job not found", 404));
  }

  await job.deleteOne();

  res.status(200).json({
    success: true,
    message: "job is deleted.",
  });
});
