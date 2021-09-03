import mongoose, { Schema } from 'mongoose';

const order_schema =  mongoose.Schema(
    {
        customer_id:{
            type : mongoose.Schema.Types.ObjectId,
            ref:'User',
            required:true
            
        },
        garage_id: {
            type : mongoose.Schema.Types.ObjectId,
            ref:'Garage',
            required:true

        },
        service_id:{
            type : mongoose.Schema.Types.ObjectId,
            ref:'Service',
            required:true

        },
        issued_date:{
            default: Date.now,
            required:true
        },
        completed_at:{
            type: Date
        }
    }
)

userSchema.method("toJSON", ()=>{
    const { __v, _id, ...object } = this.toObject();
    object.id = _id;
    return object;
})

const Order = mongoose.Model("order", serviceSchema);
export default Order;