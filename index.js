require("dotenv").config();

const express = require("express");
const app = express();

app.use(express.json());

// USER
app.use("/api/user/assessments", require("./routes/assessments"));
app.use("/api/user/bookmarks", require("./routes/bookmarks"));

// ADMIN
app.use("/api/admin/questions", require("./routes/questions"));
app.use("/api/admin/bookmarks", require("./routes/bookmarks"));

app.listen(3000, () => {
  console.log("Server running on port 3000");
});