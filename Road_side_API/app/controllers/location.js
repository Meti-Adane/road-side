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
        res.status(409).send("CONFLICT garage already added to location")
    }
}

