import Garage from '../model/Garage.js';

export const getAllGarages = (req, res) => {

}

export const getGarageById = (req, res) => {

}

export const addNewGarage = (req, res) => {
    const newGarage  = {
        name: "Brown sugar",
        username:"brown123",
        password:"brown12345",
        description : "The best auto repair shop",
        location:{
            type:String,
        },
        contact:[{email:"brown@gmail.com", phone_number:"0922654231"}, {email:"brown2@gmail.com", phone_number:"0933654231"}],
        opening_hour:"6:00 AM",
        closing_hour:"10:00PM",
        services:[ ],
    }
}

export const deleteGarage = (req, res) => {

}

export const findNearByGarage = (req, res) => {
    
}