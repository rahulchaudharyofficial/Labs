/**
 * Gatekeeper Service(s) controller
 */

@RestResource(urlMapping='/v01/gks')
global class GatekeeperController {
    @HttpPost
    global static String doPost() {
        GatekeeperUtil.GatekeeperResponse response = new GatekeeperUtil.GatekeeperResponse();
        IGatekeeperHandler handler = new GatekeeperHandler();
        RestRequest req = RestContext.request;
        try
        {
            response = handler.handle(req);
        }
        catch(Exception e)
        {
            response.status = GatekeeperUtil.STATUS_ERROR;
            response.statusCode = GatekeeperUtil.STATUS_CODE_ERROR;
            response.response = e.getMessage();
            response.request = req;
        }
        return JSON.serialize(response);
    }
}