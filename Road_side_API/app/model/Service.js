import mongoose, { Schema } from "mongoose";

const serviceSchema = mongoose.Schema(
    {
        name: String,
    }
)

userSchema.method("toJSON", ()=>{
    const { __v, _id, ...object } = this.toObject();
    object.id = _id;
    return object;
})

const Service = mongoose.Model("service", serviceSchema);
export default Service;