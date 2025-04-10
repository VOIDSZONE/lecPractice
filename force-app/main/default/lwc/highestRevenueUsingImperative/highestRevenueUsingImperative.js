import { LightningElement } from 'lwc';
import getHighestRevenue from '@salesforce/apex/AccountController.getHighestRevenue';

export default class HighestRevenueUsingImperative extends LightningElement {
    accountToDisplay = [];
    countOfRecords = 5;

    connectedCallback(){
        getHighestRevenue({count: this.countOfRecords}).then(response => {
            this.accountToDisplay = response;
        }).catch(error => {
            console.log(error);
        })
    }

    setCount(event){        
       this.countOfRecords = event.target.value;
       
       getHighestRevenue({count: this.countOfRecords}).then(response => {
            this.accountToDisplay = response;
        }).catch(error => {
            console.log(error);
        })
    }
}