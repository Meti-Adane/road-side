import mongoose, { Schema } from 'mongoose';

// schema for contact of garage
const contact_schema = mongoose.Schema(
    {
        email:{
            type:String,
            required:true,
            set : toLower,
            unique: true,
        },
        phone_number:{
            type: Array,
            required: true,
        },
    }
)


const garage_schema = mongoose.Schema(
    {
        name: {
            type:String,
        },
        username:{
            type:String,
            set:toLower,
            unique:true,

        },
        password:{
            type: String,
            required:true,
            min:6,
            
        },
        description : {
            type:Text,

        },
        location:{
            type:String,
        },
        contact:{
            type : [contact_schema],
            default:undefined
        },
        opening_hour:{
            type:String,
            required:true,
        },
        closing_hour:{
            type:String,
            required:true,
        },
        services:{
            type:Array,
        },

        ongoing_services : [ 
            { // only order ids are stored for ongoing services
                type : mongoose.Schema.Types.ObjectId,
                ref: 'Order',
            }
        ]

    }
)

const Garage = mongoose.model("garage", garage_schema);

export default Garage;