import { LightningElement } from 'lwc';
import createAccount from '@salesforce/apex/AccountController.createAccount';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class CreationOfAccount extends LightningElement {
    name;
    phone;
    industry;

    handleChange(event) {
        const field = event.target.name;
        this[field] = event.target.value;
    }

    handleSubmit(){
        createAccount({name: this.name, phone: this.phone, industry: this.industry})
        .then(() => {
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Success',
                    message: 'Account was created',
                    variant: 'success'
                })
            );
        })
        .catch(error => {
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Error',
                    message: error.body.message,
                    variant: 'error'
                })
            );    
        })
    }
}