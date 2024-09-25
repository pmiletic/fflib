public with sharing class OpportunitiesService {
    public static OpportunitiesService newInstance() {
        return (OpportunitiesService) Application.Service.newInstance(
            Opportunity.class
        );
    }
}
