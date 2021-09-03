import mongoose, { Schema, Document } from 'mongoose';

const Role= {
    User, 
    Admin
}
const userSchema = mongoose.Schema(
    {
        name:{
            type : String,
            required:true,            
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
        role:{
            type:Role,
            default:Role.User
        },
        profile_picture:{
            type: String            
        },
        phoneNumber:{
            type : Number,
            required : true,
            unique : true,
            min:10,
        },
        email:{
            type :String,
            set : toLower,
            unique : true,
        }, 
        order_history :{
            type:Array,
            select: false,
        },
        
        on_going_services :{ // can be retrived from order_history
            type: Array,

        },
        favorites :{
            type:Array,

        },
        rated_garages : {
            type:Array,
        }

    }
);

userSchema.method("toJSON", ()=>{
    const { __v, _id, ...object } = this.toObject();
    object.id = _id;
    return object;
})

const User = mongoose.Model("user", userSchema);
export default User;
