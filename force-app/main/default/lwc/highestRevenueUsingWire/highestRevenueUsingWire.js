import { LightningElement, wire } from 'lwc';
import getHighestRevenue from '@salesforce/apex/AccountController.getHighestRevenue';

export default class HighestRevenueUsingWire extends LightningElement {
    accountToDisplay = [];

    @wire(getHighestRevenue)
    getAccountHandler(response){
        const {data,error} = response;

        if (error) {
            console.error(error);
            return;
        }

        if(data){
            this.accountToDisplay = data;
        }
    }
}