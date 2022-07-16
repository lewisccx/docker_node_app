const express = require("express")

const app = express()


app.get('/', (req, res) => {
    res.json({
    "title": "Sample Node appaaaaaaaa" 
    });
});


const port = process.env.PORT || 3000

app.listen(port, () => {
    console.log(`Sample Node app listening on port ${port}`)
})
