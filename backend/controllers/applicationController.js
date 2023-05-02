const multer = require("multer");

const Order = require("../models/application");
const User = require("../models/user");

const path = require("path");
const ErrorHandler = require("../utils/errorHandler");
const catchAsyncErrors = require("../middlewares/catchAsyncErrors");

const Storage = multer.diskStorage({
  destination: "backend/controllers/CVs",
  filename: (req, file, cb) => {
    let ext = path.extname(file.originalname);
    if (ext !== ".pdf") {
      cb(new ErrorHandler("file type is not supported"), false);
      return;
    }
    cb(null, Date.now() + "-" + "cv" + ext);
  },
});

const upload = multer({
  storage: Storage,
}).single("testImage");

// Create new order   =>   /api/v1/admin/order/new
exports.newOrder = catchAsyncErrors(async (req, res, next) => {
  const order = await Order.findById(req.params.id).populate('user', 'name email')

  if (order) {
    return next(new ErrorHandler("You have already applied for this job", 404));
  }

  upload(req, res, async (err) => {
    if (err) {
      console.Console.log(err);
    }

    const { name, phone, email, job } = req.body;
    const orderCount = await Order.countDocuments();
    const order = await Order.create({
      name,
      phone,
      email,
      orderCount,
      job,
      cvFile: {
        data: req.file.filename,
      },
      user: req.user._id,
    });

    res.status(200).json({
      success: true,
      order,
    });
  });
});

// Get single order   =>   /api/v1/order/:id
exports.getSingleOrder = catchAsyncErrors(async (req, res, next) => {
  const order = await Order.findById(req.params.id).populate(
    "user",
    "name email"
  );

  if (!order) {
    return next(new ErrorHandler("No Order found with this ID", 404));
  }

  res.status(200).json({
    success: true,
    order,
  });
});

// Get logged in user orders   =>   /api/v1/orders/me
exports.myOrders = catchAsyncErrors(async (req, res, next) => {
  const orders = await Order.find({ user: req.user.id });

  res.status(200).json({
    success: true,
    orders,
  });
  console.log(orders);
});

// Get all orders - ADMIN  =>   /api/v1/admin/orders/
exports.allOrders = catchAsyncErrors(async (req, res, next) => {
  const orders = await Order.find();

  let totalAmount = 0;

  orders.forEach((order) => {
    totalAmount += order.totalPrice;
  });

  res.status(200).json({
    success: true,
    totalAmount,
    orders,
  });
});

// Update / Process order - ADMIN  =>   /api/v1/admin/order/:id
exports.updateOrder = catchAsyncErrors(async (req, res, next) => {
  const order = await Order.findById(req.params.id);

  if (order.orderStatus === "Viewed") {
    return next(new ErrorHandler("You have already Viewed this order", 400));
  }

  (order.orderStatus = req.body.status), (order.viewedAt = Date.now());

  await order.save();

  res.status(200).json({
    success: true,
    message: "updated",
  });
});

// Delete order   =>   /api/v1/admin/order/:id
exports.deleteOrder = catchAsyncErrors(async (req, res, next) => {
  const order = await Order.findById(req.params.id);

  if (!order) {
    return next(new ErrorHandler("No Order found with this ID", 404));
  }

  await order.remove();

  res.status(200).json({
    success: true,
    message: "job is deleted",
  });
});
