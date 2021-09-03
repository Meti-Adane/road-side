import mongoose, { Schema } from "mongoose";

const locationSchema = mongoose.Schema(
    {
        name:{
            type:String,
            set: toLower,
            unique,
            required
        },
        garages_available: [
            {
                type: mongoose.Schema.Types.ObjectId, 
                ref: 'Garage',
                unique
            }
        ]
    }
)

locationSchema.method("toJSON", ()=>{
    const { __v, _id, ...object } = this.toObject();
    object.id = _id;
    return object;
})

const Location = mongoose.Model("location", locationSchema);
export default Location;