public without sharing class GatekeeperHandler implements IGatekeeperHandler {
    private IGatekeeperValidator validator = new GatekeeperValidator();

    public GatekeeperUtil.GatekeeperResponse handle(RestRequest req) {
        GatekeeperUtil.GatekeeperResponse response = validator.validateGatekeeperRequest(req);

        return response;
    }
}