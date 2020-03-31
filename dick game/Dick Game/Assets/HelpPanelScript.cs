using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class HelpPanelScript : MonoBehaviour
{
    public void Start() {
        this.gameObject.SetActive(false);
    }
    
    // used by HelpButton to make panel appear
    public void SetActive(bool state)
    {
        this.gameObject.SetActive(state);
    }
}
