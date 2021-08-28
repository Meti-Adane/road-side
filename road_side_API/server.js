import app from './app.js';
import mongoose from 'mongoose';
import { DB_URI } from "./app/config/db.config.js";

const PORT = process.env.PORT || 8000;

mongoose.connect(DB_URI, {
    useNewUrlParser: true,
    useUnifiedTopology: true,
})
.then(() => {
    app.listen(PORT, () => console.log(`Server running on port ${PORT}`));
})
.catch((err) => console.log('Error occurred while connecting', err));
 
