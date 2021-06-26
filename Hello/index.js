const express = require("express");
const fs = require("fs");
const app = express();
if (!process.env.PORT) {
    throw new Error("Please specify the port number for the HTTP Server with the environment variable PORT.");
}
const port = process.env.PORT;
app.get("/", (req, res) => {
    res.send('Hello World');
});
app.get("/video", (req, res) => {
    const path = "../media/file_example_MP4_480_1_5MG.mp4";
    fs.stat(path, (err, stats) => {
        if(err) {
            console.error("An error occured - http 500");
            res.sendStatus(500);
            return;
        }
        res.writeHead(200, {
            "Content-Length": stats.size,
            "Content-Type": "video/mp4",
        });
        fs.createReadStream(path).pipe(res);
    });
});
app.listen(port, () => {
    console.log(`app listening on port ${port}`);
});