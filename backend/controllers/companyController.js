const multer = require("multer");
const path = require("path");

const Company = require("../models/company");

const ErrorHandler = require("../utils/errorHandler");
const catchAsyncErrors = require("../middlewares/catchAsyncErrors");

//multer config
const Storage = multer.diskStorage({
  destination: "backend/controllers/companyImages",
  filename: (req, file, cb) => {
    let ext = path.extname(file.originalname);
    if (ext !== ".jpg" && ext !== ".jpeg" && ext !== ".png") {
      cb(new ErrorHandler("file type is not supported"), false);
      return;
    }
    cb(null, Date.now() + "-" + "companyImages" + ext);
  },
});

const upload = multer({
  storage: Storage,
}).single("testImage");

// Create new company   =>   /api/v1/admin/company/new
exports.newCompany = catchAsyncErrors(async (req, res, next) => {
  try {
    upload(req, res, async (err) => {
      if (err) {
        console.Console.log(err);
      }

      const { name, description, phone, email, location } = req.body;
      const companyCount = await Company.countDocuments();
      const company = await Company.create({
        name,
        description,
        phone,
        email,
        location,
        num: companyCount,
        companyImage: {
          data: req.file.filename,
        },
      });

      res.status(200).json({
        success: true,
        company,
      });
    });
  } catch (err) {
    next(err);
  }
});


// Get all companys (Admin)  =>   /api/v1/admin/companys
exports.getAdminCompanies = catchAsyncErrors(async (req, res, next) => {
  const companys = await Company.find();

  res.status(200).json({
    success: true,
    companys,
  });
});

// Get single company details   =>   /api/v1/company/:id
exports.getSingleCompany = catchAsyncErrors(async (req, res, next) => {
  const company = await Company.findById(req.params.id);

  if (!company) {
    return next(new ErrorHandler("company not found", 404));
  }

  res.status(200).json({
    success: true,
    company,
  });
});

// Update company   =>   /api/v1/admin/company/:id
exports.updateCompany = catchAsyncErrors(async (req, res, next) => {
  let company = await Company.findById(req.params.id);

  if (!company) {
    return next(new ErrorHandler("company not found", 404));
  }

  company = await Company.findByIdAndUpdate(req.params.id, req.body, {
    new: true,
    runValidators: true,
    useFindAndModify: false,
  });

  res.status(200).json({
    success: true,
    company,
  });
});

// Delete company   =>   /api/v1/admin/company/:id
exports.deleteCompany = catchAsyncErrors(async (req, res, next) => {
  const company = await Company.findById(req.params.id);

  if (!company) {
    return next(new ErrorHandler("company not found", 404));
  }

  await company.deleteOne();

  res.status(200).json({
    success: true,
    message: "company is deleted.",
  });
});
