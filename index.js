require("dotenv").config();
const express = require("express");
const app = express();

app.use(express.json());

app.use("/api/assessments", require("./routes/assessments"));
app.use("/api/bookmarks", require("./routes/bookmarks"));
app.use("/api/assessment-questions", require("./routes/questions"));
app.listen(3000, () => {
  console.log("Server running on port 3000");
});
