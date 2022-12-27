const { calculateObjectSize } = require("bson");
const { MongoClient } = require("mongodb");
const Db = process.env.ATLAS_URI;
const client = new MongoClient(Db, {
    useNewUrlParser: true,
    useUnifiedTopology: true,
});

var _db;

module.exports = {
    connectToServer: function (callback) {
        client.connect(function (err, db) {
            // Verify db is valid
            if (db) {
                _db = db.db("employees"); // TODO: replace with database name
                console.log("Mongo: Successfully connected to MongoDB :)");
            }
            return callback(err);
        });
    },

    getDb: function () {
        return _db;
    },
};