import mongoose, { Schema } from 'mongoose'
import User from './User.js'
import Garage from './Garage.js'
import Service from './Service.js'
const orderSchema = mongoose.Schema(
    {
        user_id = {
            type: Schema.Types.ObjectId,
            ref: User,
            required
        },
        garage_id = {
            type: Schema.Types.ObjectId,
            ref: Garage,
            required
        },
        status = {
            type: String,
            default: "incomplete"
        },
        issued_date = {
            type: Date,
            default: Date.now()
        },
        completed_date = {
            type: Date
        },
        service_type = {
            type: Schema.Types.ObjectId,
            ref: Service,
            default: "quick_fix"
        }
    }

)
const Order = mongoose.Model('order', orderSchema);
export default Order;
    