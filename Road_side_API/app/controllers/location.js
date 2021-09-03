import Location from "../model"
export const addGarageToLocation = (req, res) => {
    const area = req.body.location
    const garage_id = req.body.garage_id

    if (! (garage_id && area)) {
        res.status(400).send("BAD REQUEST all fields are required").end()
    }
    try {
        const query = { "name": area };
        const updateDocument = {
          $push: { "garages_available.$[]": garage_id }
        };
        const result = await Location.updateOne(query, updateDocument)
        res.status(200).send("OK").end()
        
    } catch (error) {
        console.log(error)
        res.status(409).send({
            message: error.message || "CONFLICT garage already added to location"
        }).end();
    }
}

export const getNearByGarages = (req, res) => { //send partial data
    const locationName = req.body.location_name
    if (!locationName) res.status(400).send("BAD REQUEST all inputs are required").end()
    const query = { "name": area }
    Location.find(query, 'available_garages', (err, data) => {
        if (err) res.status(500).send(err || "SERVER INTERNAL ERROR").end()
        if (!data) res.status(404).send("Could not find Available garages").end()
        res.status(200).send({available_garages:data}).end()
    })
}

export const getAllLocations = (req, res) => {
    Location.find({}, 'names', function (err, garages) {
        if (err) res.status(500).send('INTERNAL SERVER ERROR || Soemthign went wrong whilr retriving ').end();
        res.status(201).send("OK").end()        
    });
}