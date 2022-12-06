public class Car {
    public string carColor = '';
    // If we don't write access modifier, default is Private.
    integer maxSpeed = 150;
    public string carName = '';


    public void switchOn(){
        datetime switchOnTime = datetime.now();
        system.debug('starting the car');
    }

    public void drive(){
        system.debug('Driving' + carName + ', color is ' + carColor);

    }
    public void driveAtMaxSpeed(){
        string drivingDescription = 'Driving' + carName + ' at ' + maxSpeed + ' km/h';
        system.debug(drivingDescription);
    }
}
