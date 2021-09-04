import Location from "../model/Location.js"

export const addLocations = (req, res) => {
    const locations = [{name:"wesen"}, {name:"Abo"}, {name:"mexico"}]
    Location.insertMany(locations)
    .then(data => {
        if (!data) res.status(400).send({messgae:"BAD REQUEST"}).end()
        res.status(200).send({messgae:"OK LOCATIONS ADDED", locations: data}).end()
    })
    .catch (err => {
        res.status(500).send({messgae:"INTERNAL SERVER ERROR", locations: data}).end()
    })
}
export const addGarageToLocation = (req, res) => {
    const area = req.body.location
    const garage_id = req.body.garage_id

    if (! (garage_id && area)) {
        res.status(400).send("BAD REQUEST all fields are required").end()
    }
    const query = { "name": area };
    const updateDocument = {
        "garages_available.$[]": garage_id 
    };
    Location.updateOne(query, updateDocument)
    .then(data => {
        if (!data) {
            res.status(404).send({messgae:"NOT FOUND couldnt update"}).end()
        }
        res.status(200).send({message:"OK"}).end()
    })
    .catch (err => {
        res.statu(500).send({messgae: err || "INTERNAL SERVER error"}).end()
    })
     
}

export const getNearByGarages = (req, res) => { //send partial data
    const location_name = req.body.id
    console.log(location_name)
    console.log("====================================")
    console.log(req.params)
    console.log("===========", location_name)
    console.log("====================================")
    if (!location_name) res.status(400).send("BAD REQUEST all inputs are required").end()
    const query = { name: location_name }
    Location.find(query, 'available_garages', (err, data) => {
        if (err) res.status(500).send(err || "SERVER INTERNAL ERROR").end()
        if (!data) res.status(404).send("Could not find Available garages").end()
        res.status(200).send({available_garages:data}).end()
    })
}

export const getAllLocations = (req, res) => {
    Location.find({}, 'name', function (err, data) {
        if (err) res.status(500).send('INTERNAL SERVER ERROR || Soemthign went wrong whilr retriving ').end();
        res.status(201).send({message:"OK", locations:data}).end()        
    });
}