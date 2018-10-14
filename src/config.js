function getPlacesHost() {
    if (process.env.NODE_ENV === 'production') {
        return 'https://places.palestinenights.com'
    } else {
        return 'http://localhost:8000'
    }
}

module.exports = {
    placesHost: getPlacesHost()
}